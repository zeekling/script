#!/usr/bin/env bash
# 本脚本用于提交所有代码到远程仓库的脚本，简化操作
# 脚本使用：
# 1. 将脚本放到/usr/bin下面: sudo mv ./mygit.sh /usr/bin/mygit
# 2. 在当前git项目路径下执行:mygit branch(分支名称) msg(提交信息)
# author: zeekling

BRANCH=master
if ! test -z $1;then
	BRANCH=$1
fi
# 修复以前提示信息不能传入空格的bug
shift 1
if test -z $*;then
	git add -A
	git commit &&
		git pull origin ${BRANCH} && git push origin ${BRANCH}
	exit 0
else
	git add -A
	git commit -m "$*" &&
		git pull origin ${BRANCH} && git push origin ${BRANCH}
	exit 0
fi
