TensorFlow Installation
-----------------------
The following sequence of scripts should install TensorFlow on an amazon AMI (note that this
requires re-sizing the root volume to at least 15GB):

1. `. base.sh`
2. `. setup_virtualenv.sh`
3. `mkvirtualenv ds`
4. `. setup_scientific_python.sh`
5. `. setup_cuda.sh`
6. `. setup_tensorflow.sh`

The last step will ask you a few questions. Cuda is installed in /usr/local/cuda and you want to use Cuda 7.0, cuDNN 6.5, and Cuda compute capabilities 3.0.
