// Can be used to monitor the completion of a task (mainly for cmd usage for now)
// 
// TODO: remainingTime convertion, rename printStep and others, add 'both' progressFormat
// 


to exampleProgressCounter {
  setGlobal 'p' (newProgressCounter)
  setGlobal 'n' 3000
  initializeProgressCounter (global 'p') (global 'n') 5 'b'
  print (usecsToRun (function {repeat (global 'n') { incrementAndPrint (global 'p'); sleep 5 }}))
  
}

defineClass ProgressCounter timer total localCurrent printStep progressFormat
// printStep can be used if you don't want an output every time but rather every n time


to newProgressCounter {
  return (new 'ProgressCounter')
}

method initializeProgressCounter ProgressCounter n steps format {
  if (isNil format) {format = '%'}
  if (isNil steps) {steps = 1}
  printStep = steps
  progressFormat = format
  total = n
  localCurrent = 0
  timer = (newTimer)
}


method incrementAndPrint ProgressCounter msg {
  localCurrent += 1
  printProgress this localCurrent msg
  
}

method printProgress ProgressCounter current msg {
  if (isNil msg) { msg = '' }
  if (msg != '') { msg = (join msg ' -') }
  if ((current % printStep) != 0) { return }

  if (current == 1) { 
    reset timer
    print msg (progressionString this current)
    return
  }

  print msg (progressionString this current) '' (remainingTimeString this current) 'remaining'
}

method progressionString ProgressCounter current {
  if (progressFormat == '%') { return (join '' (round ((current / total) * 100) 0.1) '%') }
  
  return (join '' current '/' total)
}

method remainingTimeSecs ProgressCounter current {
  time = ((usecs timer) / 1000000)
  return ((time / ((current - 1) / total)) - time)
}

method remainingTimeString ProgressCounter current {
  return (join '' (round (remainingTimeSecs this current) 0.1) 's')
}

