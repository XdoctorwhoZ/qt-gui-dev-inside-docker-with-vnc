#!/bin/bash

docker run -it -p 5900:5900 -v ${PWD}:/app --rm qt
