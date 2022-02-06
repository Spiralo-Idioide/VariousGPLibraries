// This is not a complete replacement for integers.
// The original purpose was to make some code easier to read,
// but this custom int is much slower and is unusuable most of
// the time.
// It is really just that I like this syntax. Writing and reading
// it feels much better. 
// 
// 
// For example, if we want to increment an item in an array:
// Integer : atPut array i ((at array i) + 1) 
// Custom  : (at array i) += 1
// 

defineClass customInt value



to c value { return (new 'customInt' value) }

method toInteger customInt { return value }
method toInt customInt { return value }
method value customInt { return value }

method print customInt { print value }

method toString customInt { return (toString value) }




// Increments and similar
// The argument must be a normal integer 

method '+=' customInt n { value += n }

method '-=' customInt n { value += (0 - n) }

method '*=' customInt n { value = (value * n)}
