# Documentation

## Tofu Parser

### Interface

This module exposes only one of its methods to the outside world.

`draw-tofu-file`

The rest are kept private, for internal use.

### draw-tofu-file

Inputs: This function takes as arguments a dc and a path to a tofu file.

Description: This method takes the file, parses it and draws it to the dc.

Output: Drawn file on the dc.

### read-tofu-file

Inputs: Path to a ToFu file

Description: This path receives the path to a ToFu file, and parses the json into a hash that can be used internally in Racket.

Output: jsexpression

### draw-tofu
Inputs: dc and a parsed tofu in the shape of a jsexpression

Description: Takes the parsed tofu file, and iterates over all its vectors putting them on the dc.

Output: Drawn vectors on the dc.

### vector-to-path
Inputs: vector

Description: Takes a ToFu vector, and transforms it into a drawable path.

Output: Drawable path.

### vector-vertices
Inputs: vector

Description: Takes a ToFu vector and returns a list of its vertices.

Output: List of vertices