#!/bin/bash

echo "Did you run ./configure with iOS + Android support in ./tensorflow/ already?"
echo "Did you run ./configure with iOS + Android support in ./tensorflow/ already?"
echo "Did you run ./configure with iOS + Android support in ./tensorflow/ already?"
echo "Did you run ./configure with iOS + Android support in ./tensorflow/ already?"
echo "Did you run ./configure with iOS + Android support in ./tensorflow/ already?"
echo "Did you run ./configure with iOS + Android support in ./tensorflow/ already?"
echo "Did you run ./configure with iOS + Android support in ./tensorflow/ already?"
echo "Did you run ./configure with iOS + Android support in ./tensorflow/ already?"

read -p "Did you run ./configure with iOS + Android in /tensorflow/ already? [yN]: " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]
then
  # Assumes the user ran ./configure in tensorflow/ already
  cd tensorflow

  bazel build --config=ios_fat -c opt --cxxopt=--std=c++17 //tensorflow/lite/ios:TensorFlowLiteC_framework
  bazel build --config=ios_fat -c opt --cxxopt=--std=c++17 //tensorflow/lite/ios:TensorFlowLiteCCoreML_framework

  cd ..

  cp -f -r tensorflow/bazel-bin/tensorflow/lite/ios/ ios/

  unzip -o ios/TensorFlowLiteC_framework.zip -d ios
  rm ios/TensorFlowLiteC_framework.zip

  unzip -o ios/TensorFlowLiteCCoreML_framework.zip -d ios
  rm ios/TensorFlowLiteCCoreML_framework.zip
fi
