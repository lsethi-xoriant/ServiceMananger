stores = Store.all
stores[0].groups<< Group.find(3)
stores[1].groups<< Group.find(4)