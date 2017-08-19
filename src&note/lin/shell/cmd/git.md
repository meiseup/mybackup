```bash
git init
git add . 
git commit -m "mybackup" -a
git remote add origin git@github.com:meiseup/mybackup.git
git push -u origin master 
```

```bash
# 测试公钥
ssh -T git@github.com
# 生成公钥对
ssh-keygen -t rsa -C "meiseup"
```
将 rsa 公钥（~/.ssh/id_rsa.pub）添加到 git 帐号上


重新测试：
ssh -T git@github.com


The Commiter Configure:
========== $HOME/.gitconfig ========== 
```bash
[user]
	email = 
	name = 
```

```bash
git push -u origin master 
git pull origin master 
```

