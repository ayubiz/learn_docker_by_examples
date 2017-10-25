import sys
import argparse
from resnet50 import ResNet50
import numpy as np
from keras.preprocessing import image
from imagenet_utils import preprocess_input, decode_predictions

model = ResNet50(weights='imagenet')

a = argparse.ArgumentParser()
a.add_argument("--image", help="path to image")
args = a.parse_args()

if args.image is None:
    a.print_help()
    sys.exit(1)

img_path = args.image
img = image.load_img(img_path, target_size=(224, 224))
x = image.img_to_array(img)
x = np.expand_dims(x, axis=0)
x = preprocess_input(x)

preds = model.predict(x)
print('Predicted:', decode_predictions(preds))
