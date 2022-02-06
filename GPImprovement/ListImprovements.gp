// Various things that I want to add to lists


// Generate list

to newList n fillValue {
  return (toList (newArray n fillValue))
}


to glf n function { // Needs renaming
  // Generate a list based on a function. The function has an input variable that is 
  // incremented at each step.
  // Example: glf 10 (function a {return a}) 
  // > (list 1 2 3 4 5 6 7 8 9 10)
  
  if (isClass function 'String') { function = (functionNamed function)}
  out = (newList n)
  
  for i n {
    atPut out i (call function i)
  }
  
  return out
}

// Do an action for every item

method doForAll List func modifFlag {
  // TODO: Make an explanation for the modifFlag
  i = 0
  if (== modifFlag false) { // For example print all the item of the list
    for x this {
      i += 1
      call func x
    }
  } else { // For example toFloat all the integers in the list
    for x this {
      i += 1
      atPut this i (call func x)
    }  
  }
  
}

method forAllCopy List function { // Create a copy of the list then apply the function on every item
  if (isClass function 'String') { function = (functionNamed function)}  
  out = (copy this)
  i = 0
  
  for x out {
      i += 1
      atPut out i (call function x)
  }
  return out
}

method faa List function args... { // Output a copy of the list then apply the function on every item
  
  args = (newArray ((argCount) - 2))
  if ((argCount) > 2) {
    for i ((argCount) - 2) { atPut args i (arg (i + 2)) }
  }
  
  args = (join (array nil) args)
  
  
  out = (copy this)
  i = 0
  for x out {
      i += 1
      atPut args 1 x
      atPut out i (callWith function args)
  }
  return out

}
  
