## install extensions
xargs -n 1 code --install-extension < ~/.other/vscode-ext.txt

## get the real extension store
sudo sed -i 's;"serviceUrl":.*";"serviceUrl": "https://marketplace.visualstudio.com/_apis/public/gallery";' /usr/lib/code/product.json
sudo sed -i 's;"itemUrl":.*";"itemUrl": "https://marketplace.visualstudio.com/items";' /usr/lib/code/product.json
