# UItableView+WWSeparate
    替代系统UItableView的分割线

### 替代系统UItableView的分割线,也可以根据需要改默认设置
### 1.导入分类:
    #import "UITableViewCell+WWSeparate.h"
### 2.设置分割线:
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
### 3.使用:
    //根据需要控制不同行的间距
    CGFloat leftMargin = indexPath.row % 2 ? 0 :10;
    [cell ww_setBottomLineViewWithLeftMargin:leftMargin];

    或者
    [self.redView ww_setBottomLineViewWithLeftMargin:0];

<img src="https://raw.githubusercontent.com/spWang/UItableViewSeparate/master/demo.png" width="375" height="667">

