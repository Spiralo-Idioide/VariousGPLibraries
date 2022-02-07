
// Simple alternative to tables. Faster for most of the things
// Not currently stable
// Items are accessed like that (cellAt row column)
// The dimensions can't be changed after the array is generated 
// (you would have to generate a new object)
//
//  Example : 
//  (array
//    (array 1:1  1:2  1:3)
//    (array 2:1  2:2  2:3)
//    (array 3:1  3:2  3:3)
//    (array 4:1  4:2  4:3)
//  )
// 
//  To get 3:2 cell value you need to use (cellAt 3 2) 


defineClass Array2D rows


method columnCount Array2D  { return (count (at rows 1)) }
method rowCount    Array2D  { return (count rows) }
method count       Array2D  { return (count rows) } 
method isEmpty     Array2D  { return (== (count rows) 0) }


// Get data from array

method cellAt Array2D row column { return (at (at rows row) column) }

method rows Array2D { return rows }

method row Array2D row { return (at rows row) }

method columns Array2D {
  colCount = (columnCount)
  out = (newArray colCount)
  for columnIndex colCount {
    atPut out columnIndex (column this columnIndex)
  }
  return out
}

method column Array2D column {
  output = (newArray (rowCount this))
  i = 0
  for row rows {
    i += 1
    atPut output i (at row column)
  }
  return output
}


// Edit Array

method cellAtPut Array2D rowIndex columnIndex value {
  atPut (at rows rowIndex) columnIndex value
}

method rowAtPutFast Array2D rowIndex rowData {
  // THERE IS NO CHECK IF THE DATA IS AN ARRAY OF THE GOOD SIZE
  atPut rows rowIndex rowData
}

method rowAtPut Array2D rowIndex rowData {  // To improve
  out = (copyArray rowData (colCount this) 1)
  atPut rows rowIndex rowData
}

method columnAtPut Array2D columnIndex columnData { // To improve
  // Add a default value if the columnData isn't long enough
  i = 0
  for row rows {
    i += 1
    atPut row columnIndex (at columnData i) 
  }
}


// Generating

to newArray2D rowCount columnCount value {
  output = (new 'Array2D')
  array2dWithDimensions output rowCount columnCount value
  return output
}

to newArray2DWithColumns args... {
  rowCount = (count (arg 1))
  
}

method array2dWithDimensions Array2D rowCount columnCount value { // This really needs to be renamed
  rows = (newArray rowCount)
  
  
  for i rowCount {
    atPut rows i (newArray columnCount value)
  }
}

method importCSV Array2D lines hasHeaders delimiter { // a lot simpler than the table equivalent
  if hasHeaders {shift = 1} else {shift = 0}
  
  print (join 'rowCount = ' (toString (rowCount this)))
  for i ((rowCount this) - shift) {
    rowData = (at lines (i + shift))
    rowAtPut this i (splitWith rowData ',')
    if (== 0 (i % 1000)) {
      print i
      print (mem)
      // gcT
    }
  }
  
}

method importCSV2 Array2D lines hasHeaders delimiter { // a lot simpler than the table equivalent
  
  print (join 'rowCount = ' (toString (rowCount this)))
  print (join 'colCount = ' (toString (columnCount this)))
  
  for i (rowCount this) {
    rowData = (splitWith (at lines i) delimiter)
    
    for i2 (columnCount this) {
      data = (at rowData i2)
      toNum = (toNumber data nil)
      if (notNil toNum) {
        cellAtPut this i i2 toNum
      } else {
        cellAtPut this i i2 data
      }
    }
  }
}

method copyArray2D Array2D newRowCount newColumnCount rowStartIndex colStartIndex { // To do
  
}


to importArray2DFromFile path hasHeaders delimiter {
  if (isNil hasHeaders) {hasHeaders = true} // headers are not included in the object
  if (isNil delimiter) {delimiter = ','}
  
  linesData = (lines (readFile path))
  lineCount = (count linesData)
  print lineCount
  colCount = (count (splitWith (at linesData 1) delimiter))
  
  if hasHeaders {
    lineCount += -2
    linesData = (copyArray linesData lineCount 2 )
  }
  output = (newArray2D lineCount colCount)
  
  
  importCSV2 output linesData hasHeaders delimiter
  
  return output
  
  
  
}

to exportCSV aa delimiter {
  out = (list)
  for row (rows aa) {
    add out (joinStrings row delimiter)
  }
  
  return (joinStrings out (newline))
}



// Tests


method randFillN Array2D {
  count = (columnCount this)
  for rowIndex count {
    rowAtPut this rowIndex (randArray count 0 9999)
  }
}

to fullRand {
  tmp = (newArray2D 1000 1000)
  randFill tmp
  return tmp
}

to fullRandN {
  tmp = (newArray2D 40000 1000)
  randFillN tmp
  return tmp
}





