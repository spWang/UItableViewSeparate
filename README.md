# UItableView+WWSeparate
替代系统UItableView的分割线

### 可以轻松设置分割线距离左边tableViewCell的间距, 当然也可以根据自己需要改源码
### 用法:
### 1.导入分类:
#import "UITableViewCell+WWSeparate.h"
### 2.设置分割线:
self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
### 3.使用:
//根据需要控制不同行的间距
CGFloat leftMargin = indexPath.row % 2 ? 0 :10;
[cell ww_setupBottomLineViewWithLeftMargin:leftMargin];

<img src="https://raw.githubusercontent.com/spWang/UItableViewSeparate/master/demo.png" width="375" height="667">

