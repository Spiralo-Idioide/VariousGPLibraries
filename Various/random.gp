// Just random things

to randArray lenght objType args... {
  // Create a new array containing randomized objects
  // You can even create an array of arrays : (randArray 3 'Array' 3 'Integer' 20 40) 
  // or more
  
  if (isNil objType) {objType = 'Integer'}
  out = (newArray lenght)
  
  allArgs = (newArray ((argCount) - 1) )
  for i (count allArgs) { atPut allArgs i (arg (i + 1))}
  
  for i lenght { atPut out i (callWith 'randObj' allArgs) }
  return out
}

to randTable rowCount columnCount 'objType' args... {
  // Should be rewritten
  out = (callWith 'table' (range columnCount))
  
  allArgs = (list) // need to be renamed
  
  for i (range 3 (argCount - 2)) {
    add allArgs (arg i)
  }
  
  for i rowCount {
    addRow out (callWith 'randArray' columnCount (toArray allArgs))
  }
  
  return out
}

to randObj objType args... {
  // Create a new randomized object using callWith (join 'rand' objType)
  // To do : Clean the code
  
  functionName = (join 'rand' objType)
  
  allArgs = (newArray ((argCount) - 1) )
  for i (count allArgs) { atPut allArgs i (arg (i + 1))}
  
  return (callWith functionName allArgs)
}

to randArrayFromInput input lenght {
  // Return a new array of the given lenght with items randomly picked from the input
  // Input can be an array, list or string. Dictionary can work if keys are integers
  // TODO: Change name to avoid confusion with shuffled, add a weighting array (maybe in another function)
  
  count = (count input)
  out = (newArray lenght)
  
  for i lenght {
    atPut out i (at input (rand count))
  }
  
  return out
}


// Create new random objects

to randString lenght minCode maxCode {
  if (isNil minCode) {minCode = 32}
  if (isNil maxCode) {maxCode = 126}
  
  return (callWith 'string' (randNumArray lenght minCode maxCode))
}

to randInteger min max {
  // Will return a float if feeded float
  return (rand min max)
}

to randNum min max {
  // Return an integer if feeded only integers, return a float if feeded at least 1 float
  return (rand min max)
}

to randFloat min max {
  // Always return a float
  if (isNil min) {
    min = 1.0
    max = 100
  }
  
  if (isNil max) {
    max = min
    min = 1.0
  }
  
  return (rand (toFloat min) max)
}

to randNumArray lenght min max {
  // Generate an array of random numbers, 15x faster than randArray
  // If min or max are integers the output will be integers

  if (isNil min) {min = 1}
  if (isNil max) {max = 100}
  
  out = (newArray lenght)
  for i lenght {
    atPut out i (rand min max)
  }
  return out
}

to randHex lenght {
  // generate a random hex string
  charsList = (array '0' '1' '2' '3' '4' '5' '6' '7' '8' '9' 'A' 'B' 'C' 'D' 'E' 'F') // faster than using char codes
  return (joinStringArray (randArrayFromInput lenght charsList))
}

to randBinaryData lenght {
  out = (newBinaryData lenght)
  for i lenght { byteAtPut out i (rand 0 255)}
  return out
}
