### 知乎图片下载脚本
- 下载知乎指定问题下所有答案的图片
- 下载知乎指定收藏夹下所有问题下所有答案的图片
- 不能处理需要点击 更多 才能显示的答案

### 使用
- 首先需要 ruby 环境，版本 2.2.2 ，其他版本应该也没问题 --
- 其次需要 nokogiri 这个 gem ，直接 gem install nokogiri 就可以
- 最后在命令行输入 ruby entry.rb (问题或收藏夹路径) (保存目录)

### 使用示例
- ruby entry.rb https://www.zhihu.com/question/30477915 ./imgs
- ruby entry.rb https://www.zhihu.com/collection/26347524 ./imgs
