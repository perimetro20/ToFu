# ToFu

## Demo

[Video Demo on YouTube]( https://youtu.be/-qsGCZawOlE)

## Style Guide for the Project

[How to Program Racket: a Style Guide](http://docs.racket-lang.org/style/index.html)

## How to run the project

If an executable is not provided for your platform.

### 1. Download and Install Racket

Follow the instructions on [How to Install Racket](https://docs.racket-lang.org/pollen/Installation.html)

### 2. Open the main.rkt file.

Navigate to the `src` directory on this project, and open the `main.rkt` file,
it will open by default on Dr. Racket. The Racket programming environment.

### 3. Run the Program Directly or Compile the Application.

To run the program directly you can press the green arrow in the top right corner of Dr. Racket, this will launch a new fully functional instance of the project.

Alternatively you can create an executable for your platform following the official Racket documentation.

[Creating Executables](http://docs.racket-lang.org/drracket/create-exe.html)

### 4. Profit

## Architecture Evaluation

The code is centered on a functional style of programming.

The main architectural pattern followed for this application is Model-View-View-Controller (MVVC).

This architectural pattern is necessary for the main goals of the project which are to allow the creation and edition of vectors and images through code and visualizing the changes made.

The model is the ToFu file a specifically formatted json file which condenses the information and description of the image in use.

The first-view is the text-editor window on the left which displays the state of the file in its current program state.

The second-view is the visualizer-panel on the right which displays the state of the file on disk.

The controller is the direct interaction with the file format itself.

### Advantages

Extending a popular format such as json allows us to make the file-format highly portable, and a parser easy to implement in other languages.

The text-editor controller allows for extreme granularity when modifying the files, giving the user ultimate control and preventing vendor lock-in.

The visualizer eliminates the barrier to entry for many new users as it allows them to interact directly with the code they are modifying.

The use of a functional style of programming has many advantages as it eliminates sideffects, the units of code are highly reusable.

The program inherently matches the Open/Close principle as all the functions are small units with a very specific job.

The project is open for extensibility in many different ways, due to the fact that the text-file serves as a single source of truth, on which to sprout additional functionality.

The project allows the inclusion of static assets, to be tracked, followed, and used as dependencies just like any other piece of code.

### Disadvantages
Json is a very verbose format for highly hiearchical object such as images.

The transforming the visualizer component into a controller proves difficult due to the lack of an inherent state inside the application. There is no simple way to interactively match the displayed stuff and the text directly.

An interactor layer would have to be written extending the current canvas class.

The lack of objects, means that the representations on screen do not have a direct relationship with the file, so modification through them is not optimal.
