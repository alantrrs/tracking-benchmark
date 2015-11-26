FROM ubuntu:14.04

# Install build & basic dependencies
RUN apt-get -y update
RUN apt-get install -y build-essential cmake vim wget git

# Install Octave 4.0 & packages
RUN sudo apt-get update
RUN apt-get install -y software-properties-common
RUN sudo apt-add-repository ppa:octave/stable
RUN sudo apt-get update
RUN sudo apt-get install -y octave liboctave-dev zip
RUN echo "pkg install -forge -auto image" | octave
RUN echo "pkg install -forge -auto io" | octave
RUN echo "pkg install -forge -auto statistics" | octave

# Install Tracking Benchmark
ADD . /tracking-benchmark
