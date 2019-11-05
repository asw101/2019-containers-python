# 6. README

```bash
docker run -it -p 8888:8888 tensorflow/tensorflow:latest-py3-jupyter

docker run -it --rm tensorflow/tensorflow:latest-py3 \
   python -c "import tensorflow as tf; tf.enable_eager_execution(); print(tf.reduce_sum(tf.random_normal([1000, 1000])))"

curl -L `https://upload.wikimedia.org/wikipedia/commons/a/a5/Black_Converse_sneakers.JPG -o sneakers.jpg`
```

## Resources
- https://www.tensorflow.org/install/docker
- https://www.tensorflow.org/tutorials/keras/classification
- https://github.com/tensorflow/serving/blob/master/tensorflow_serving/g3doc/tutorials/Serving_REST_simple.ipynb (Note: out of date)
- https://www.pylint.org/
- https://matplotlib.org/3.1.1/users/installing.html
- https://www.tensorflow.org/tutorials/keras/save_and_load
