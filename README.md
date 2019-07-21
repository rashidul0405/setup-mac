# Setup mac
This [script](src/bootstrap.sh) sets up a new Mac machine by installing necessary tools, [packages](src/packages), [applications](src/packages/casks), [Mac App Store applications](src/packages/apps), sets up [preferences](src/os), and [.dotfiles](src/.dotfiles). This one is created according to my preferences but is easy to [customize](#customization).


### Download the script
##### Use git clone 
```sh
git clone https://github.com/rashidul0405/setup-mac.git && cd setup-mac
```
> *Unfortunately on Mac you have to install xcode command line tools to make the git commands work. Alternatively download the zip file*


### Run the script
##### sh 
```sh
sh src/bootstrap.sh 2>&1 | tee setup.log
```
##### Alternatively 
```sh
chmod +x ./src/bootstrap.sh && ./src/bootstrap.sh 2>&1 | tee setup.log
```
You can pass -v to see the verbose output as such
```sh
sh src/bootstrap.sh -v 2>&1 | tee setup.log
```


### Sit back & enjoy :relaxed:
In case of failure, you can safely run this script again. Some changes may not be available until restart.


### Customization
You can add/remove packages in [packages](src/packages), update [preferences](src/os), change [.dotfiles](sr/.dotfiles). You can review & customize the [script](src/bootstrap.sh) as well.



## Acknowledgements
This script would not be possible without [Mina Markham](https://twitter.com/MinaMarkham)'s work on [Formation](https://github.com/minamarkham/formation).
