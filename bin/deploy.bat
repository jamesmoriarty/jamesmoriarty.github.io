call .\bin\hugo.bat
git commit -am update
git subtree split --prefix public -b gh-pages
git push origin gh-pages:master
git branch -D gh-pages
