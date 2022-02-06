// Various non-comparative sorting algorithms 
// Code may contains a lot of 


// Count sorts

method cSorted Array min max { // countSort with a full count array
  rangeCount = ((max - min) + 1)
  shift = (1 - min)
  countArray = (newArray rangeCount 0)
  out = (newArray (count this))
  
  
  
  for x this {
    shifted = (+ x shift)
    atPut countArray shifted ( (at countArray shifted) + 1)
  }

  i = 0
  i2 = 0
  for x countArray {
    i2 += 1
    repeat x {
      i += 1
      atPut out i (i2 - shift) 
    }
  }
  
  return out
}

method cSortedD Array { // countSort with a dictionary
  dic = (dictionary)
  
  for x this {
    add dic x 1
  }
  
  out = (newArray (count this))
  i = 0
  for key (sorted (keys dic)) {
    for n (at dic key) {
      i += 1
      atPut out i key
    }
  }
  return out
}

// Radix count sorts

method radixCSorted Array max {
  if (isNil max) { max = (max this)}
  maxDigitCount = (dgc10 max)
  itemCount = (count this)
  
  
  thisCopy = (copy this)
  for digitIndex maxDigitCount {
    
    count = (newArray 10 0)
    
    
    // Building count Array
    for item thisCopy {
      digit = (dga10 item digitIndex)
      atPut count (digit + 1) ((at count (digit + 1)) + 1)
    }
    
    // Process prefix sum
    for i (range 2 10) {
      atPut count i ((at count i) + (at count (i - 1)))
    }
    
    // Process output
    output = (newArray itemCount)
    for i itemCount {
      item = (at thisCopy ((itemCount - i) + 1))
      digit = (dga10 item digitIndex)
      
      atPut output (at count (digit + 1)) item
      atPut count (digit + 1) ((at count (digit + 1)) - 1)
    }
    
    replaceArrayRange thisCopy 1 itemCount output
  }
    
  return thisCopy
}

method radixCSortedCustomInt Array max {
  // Same algorithm that the normal one but using customIntegers.gp
  // Slower
  if (isNil max) { max = (max this)}
  maxDigitCount = (dgc10 max)
  itemCount = (count this)
  
  
  thisCopy = (copy this)
  for digitIndex maxDigitCount {
    count = (array (c 0) (c 0) (c 0) (c 0) (c 0) (c 0) (c 0) (c 0) (c 0) (c 0))
    
    // Building count Array
    for item thisCopy {
      digit = (dga10 item digitIndex)
      (at count (digit + 1)) += 1
    }
    
    // Process prefix sum
    for i (range 2 10) {
      (at count i) += (toInt (at count (i - 1)))
    }
    
    // Process output
    output = (newArray itemCount)
    for i itemCount {
      item = (at thisCopy ((itemCount - i) + 1))
      digit = (dga10 item digitIndex)
      
      atPut output (toInt (at count (digit + 1))) item
      (at count (digit + 1)) += -1
    }
    
    replaceArrayRange thisCopy 1 itemCount output
    
  }
}

method radixCSorted256 Array max {
  if (isNil max) { max = (max this)}
  maxDigitCount = (dgc256 max)
  itemCount = (count this)
  
  
  thisCopy = (copy this)
  for digitIndex maxDigitCount {
    
    count = (newArray 256 0)
    
    
    // Building count Array
    for item thisCopy {
      digit = (dga256 item digitIndex)
      atPut count (digit + 1) ((at count (digit + 1)) + 1)
    }
    
    // Process prefix sum
    for i (range 2 256) {
      atPut count i ((at count i) + (at count (i - 1)))
    }
    
    // output = nil // To avoid using too much memory but hurt performances
    // gc
    
    // Process output
    output = (newArray itemCount)
    for i itemCount {
      item = (at thisCopy ((itemCount - i) + 1))
      digit = (dga256 item digitIndex)
      
      atPut output (at count (digit + 1)) item
      atPut count (digit + 1) ((at count (digit + 1)) - 1)
    }
    
    replaceArrayRange thisCopy 1 itemCount output
  }
    
  return thisCopy
}


// Radix bucket sorts

method radixBSorted Array max {
  if (isNil max) { max = (max this)}
  maxDigitCount = (dgc10 max)
  
  bucket = (newArray 10)
  for i 10 { atPut bucket i (new 'List' 1 0 (newArray 4)) }
  outputArray = (copy this)
  
  for digitIndex maxDigitCount {
    
    // Filling bucket
    for i 10 { removeAll (at bucket i) } // Empty Bucket
    for item outputArray {
      digit = (dga10 item digitIndex)
      add (at bucket (digit + 1)) item
    }
    
    // Rebuilding Array
    i = 1
    for list bucket {
      for item list {
        atPut outputArray i item
        i += 1
      }
    }
    
  }
  return outputArray
}

method radixBSorted256 Array max {
  if (isNil max) { max = (max this)}
  maxDigitCount = (dgc256 max)
  
  bucket = (newArray 256)
  for i 256 { atPut bucket i (new 'List' 1 0 (newArray 4)) }
  outputArray = (copy this)
  
  for digitIndex maxDigitCount {
    
    // Filling bucket
    for i 256 { removeAll (at bucket i) } // Empty Bucket
    for item outputArray {
      digit = (dga256 item digitIndex)
      add (at bucket (digit + 1)) item
    }
    
    // Rebuilding Array
    i = 1
    for list bucket {
      for item list {
        atPut outputArray i item
        i += 1
      }
    }
    
  }
  return outputArray
}

method radixBSorted65536 Array max {
  if (isNil max) { max = (max this)}
  maxDigitCount = (dgc65536 max)
  
  bucket = (newArray 65536)
  for i 65536 { atPut bucket i (new 'List' 1 0 (newArray 4)) }
  outputArray = (copy this)
  
  for digitIndex maxDigitCount {
    
    // Filling bucket
    for i 65536 { removeAll (at bucket i) } // Empty Bucket
    for item outputArray {
      digit = (dga65536 item digitIndex)
      add (at bucket (digit + 1)) item
    }
    
    // Rebuilding Array
    i = 1
    for list bucket {
      for item list {
        atPut outputArray i item
        i += 1
      }
    }
    
  }
  return outputArray
}


// Digit at for various bases
// Ex: dga10 9651 2 --> 5

to dga10 int index {
  raisedIndex = 1
  repeat index { raisedIndex = (raisedIndex * 10)}
  // raisedIndex = (truncate (raise 10 index))
  return (truncate ((int % raisedIndex) / (raisedIndex / 10)))
}

method dga8 Integer index {
  raisedIndex = (1 << (3 * index))
  return (truncate ((this % raisedIndex) / (raisedIndex >>> 3)))
}

method dga8v Integer index {
  raisedIndex = 1
  repeat index { raisedIndex = (raisedIndex * 8)}
  return (truncate ((this % raisedIndex) / (raisedIndex / 8)))
}

to dga16 int index {
  // index is 7 max
  // This is the default because I don't think there is a lot of
  // use cases that really needs to sort int over 268 435 455 (F FF FF FF)
  raisedIndex = (1 << (4 * index))
  return (truncate ((int % raisedIndex) / (raisedIndex >>> 4)))
}

method dga16v Integer index {
  // 40% slower but is not limited to an index of 7
  b = (newBinaryData 4)
  intAtPut b 1 this
  if ((index % 2) == 0) {
    return ((byteAt b (index >>> 1)) >>> 4)
  } else {
    return ((byteAt b ((index + 1) >>> 1)) % 16)
  }
}

to dga256 int index {
  b = (newBinaryData 4)
  intAtPut b 1 int
  return (byteAt b index)
}

method dga65536 Integer index {
  b = (newBinaryData 4)
  intAtPut b 1 this
  bA = (toArray b)
  // halt
  if (index == 1) {
    return ((((byteAt b 2) << 8) + (byteAt b 1)))
  }
  return ((((byteAt b 4) << 8) + (byteAt b 3)))
  
  
  // return (byteAt b index)
}

method dgc10 Integer {
  return (count (toString this))
}

method dgc16 Integer {
  
  if (this < 16) {
    return 1
  } (this < 256) {
    return 2
  } (this < 4096) {
    return 3
  } (this < 65536) {
    return 4
  } (this < 1048576) {
    return 5
  } (this < 16777216) {
    return 6
  } (this < 268435456) {
    return 7
  } else {
    return 8
  }
}

method dgc16v Integer {
  if (this == 0) { return 1 }
  n = this
  i = 0
  while (n > 0) {
    i += 1
    n = (n >>> 4)
  }
  return i
  
}

method dgc8 Integer {
  if (this == 0) { return 1 }
  n = this
  i = 0
  while (n > 0) {
    i += 1
    n = (n >>> 3)
  }
  return i
}

method dgc256w Integer {
  // Faster for int < 65536
  if (this == 0) { return 1 }
  n = this
  i = 0
  while (n > 0) {
    i += 1
    n = (n >>> 8)
  }
  return i
  
}

method dgc256v Integer {
  // Faster for int >= 65536
  if (this == 0) { return 1 }
  b = (newBinaryData 4)
  intAtPut b 1 this
  i = 4
  while ((byteAt b i) == 0) { i += -1 }
  return i
  
}

method dgc256 Integer {
  if (this < 256) {
    return 1
  } (this < 65536) {
    return 2
  } (this < 16777216) {
    return 3
  } else {
    return 4
  }
}

method dgc65536 Integer {
  if (this < 65536) { return 1 }
  return 2
}

to cpoT func maxSize maxRange timeGoal { 
  rr
  // func = (function { sorted (global 'array') })
  
  if (isNil maxSize) { maxSize = 7 }
  if (isNil maxRange) { maxRange = 8 }
  
  if (isNil timeGoal) {timeGoal = 1}
  sizeArray = (copyArray (array 10 100 1000 10000 100000 1000000 10000000) maxSize 1)
  sizeStringArray = (array '1e1' '1e2' '1e3' '1e4' '1e5' '1e6' '1e7')
  rangeArray = (copyArray (array 9 99 999 9999 99999 9999999 999999999 (maxInt)) maxRange 1)
  rangeStringArray = (array '1e1' '1e2' '1e3' '1e4' '1e5' '1e7' '1e9' 'maxInt')
  
  
  table = (callWith 'table' (join (array '') rangeStringArray))
  
  for sizeIndex (count sizeArray) {
    addRow table 
    size = (at sizeArray sizeIndex)
    cellAtPut table sizeIndex 1 (at sizeStringArray sizeIndex)
    
    for rangeIndex (count rangeArray) {
      range = (at rangeArray rangeIndex)
      gc
      setGlobal 'array' nil
      print 'randomizing'
      setGlobal 'array' (randNumArray size 1 range)
      print 'randomized'
      setGlobal 'range' range
      print 'size=' (at sizeStringArray sizeIndex)
      print 'range=' (at rangeStringArray rangeIndex)
      
      gc
      result = (ezBench func timeGoal 'averageTime')
      
      cellAtPut table sizeIndex (at rangeStringArray rangeIndex) (round result 0.01)
      setGlobal 'table' table
    }
    
  }
  setGlobal 'table' table
  print table
}


// 
