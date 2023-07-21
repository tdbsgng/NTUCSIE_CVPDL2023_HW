import torch
import numpy as np
from sklearn.decomposition import PCA
import matplotlib.pyplot as plt
from tqdm.auto import tqdm
import matplotlib.cm as cm
import torch.nn as nn
features = []
labels = [0] *300 + [1] *300 + [2]* 300 + [3] * 300

for i in range(4):
    f = torch.load(f'{i}.pt').cpu() # 先從detect.py提取feature存在0~3.pt
    features.append(f)
features = torch.cat(features).squeeze()
features = np.array(features.view(features.size()[0], -1))

colors_per_class = cm.rainbow(np.linspace(0, 1, 4))

# # Apply PCA to the features
features_pca = PCA(n_components=2, random_state=42).fit_transform(features)

print("done")
# # Plot the PCA visualization
plt.figure(figsize=(10, 8))
for label in np.unique(labels):
    plt.scatter(features_pca[labels == label, 0], features_pca[labels == label, 1], label=label, s=5)

plt.legend()
plt.savefig(f"result.png")
