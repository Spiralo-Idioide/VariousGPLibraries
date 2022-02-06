// Various tools I use to develop other functions



to ec { // clear terminal and exit (linux)
  exec 'clear'
  exit
}

method * String n {
  out = (newArray n this)
  return (joinStringArray out)
}

to rr {
  reloadLibs 'tmpTools' 'optimization' 'sortsTest' 'customInt' 'progressCounter' // '2DArray' 'ListImprovements'
  m
}


to m { loadModuleFromString (topLevelModule) (readFile 'runtime/modules/random.gpm') s}

to l { loadModuleFromString (topLevelModule) (readFile 'runtime/modules/ListImprovements.gpm') s}

to a { loadModuleFromString (topLevelModule) (readFile 'runtime/modules/Array2D.gpm') s}


to newWithNamedField class args... { // create a new object with defined fields values
  argList = (list)
  for i (argCount) { add argList (arg i) }
  removeAt argList 1
  
  obj = (new class)
  
  
  i = 1
  repeat ((count argList) / 2) {
    setField obj (at argList i) (at argList (i + 1))
    i += 2
  }
  return obj
}

to printObjectFields obj {
  objClass = (classOf obj)
  fieldNames = (fieldNames objClass)
  for fieldName fieldNames {
    print (join fieldName ':') (getField obj fieldName)
  }
}

to execSafer args... {
  // Execute a cmd with exec and wait for it to complete
  // Instead of relying on (execStatus) wich is very unreliable
  // this function create a bash script containing the given command
  // followed by the creation of a tmp file. GP execute the 
  // bash script then tries to read the tmp file until it is created
  // 
  // TODO add maxTime, rename tmpFilePath, windows & mac compatibility
  if ('Linux' != (platform)) { error 'execSafe is for Linux Only' }
  
  waitTimeMs = 50
  tmpFilePath = '/tmp/GPExecSaferTmp.txt' 
  
  
  if (notNil (readFile tmpFilePath)) { deleteFile tmpFilePath }
  cmdLine = ''
  argList = (list)
  for i (argCount) {
    cmdLine = (join cmdLine (toString (arg i)) (space))
  }
  
  bashFilePath = '/tmp/GPExecSafer.sh'
  bashText = (join cmdLine (newline) 'touch "' tmpFilePath '"')
  writeFile bashFilePath bashText
  exec 'bash' bashFilePath
  
  while (isNil (readFile tmpFilePath)) {
    sleep waitTimeMs
  }
}

to op { openProjectEditor }


to rfa n max min { // setGlobal 'a' (randNumArray)
  if (isNil n) { n = 10000}
  if (isNil min) { min = 1}
  if (isNil max) { max = 100}
  
  setGlobal 'a' (randNumArray n min max)
}
