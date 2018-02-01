# machine-vision-image-processing
Introduction to image processing functions in Python (Jupyter Notebook) and MATLAB

If you are new to Python and just want to run the notebooks quickly, 
there is a snapshot of my [Anaconda](https://www.anaconda.com/download/) 
environment in this repo called `machine_vision_env.yml`.

Installing the environment wil fetch all of the dependencies (e.g `numpy`, `scipy`, `scikit-image`) at once. Once you have installed Anaconda, run:

`conda env create -f machine_vision_env.yml`

and to use it:
`source activate mv-py35`

Note: I usually like to give my python environments a short but descriptive name, like tf140-py35 where 140 means version 1.4.0 of a major library like TensorFlow, and py35 is the Python major and minor version (e.g 35 = 3.5.x).

Then, run `jupyter notebook` to launch a Jupyter session on localhost, 
it should open in your browser automatically, otherwise click on the URL in the terminal or paste into your browser. 

From there click on any of the files ending in `*.ipynb`.

If you find a problem with any of the examples or have suggestions for improvements, use the `issues` tab to describe the issue. That way other people will know if others have run into a similar problem and if it has already been solved.

The MATLAB examples (files ending in `*.m`) may require the Image Processing toolbox, which should already be installed on SOE machines.
