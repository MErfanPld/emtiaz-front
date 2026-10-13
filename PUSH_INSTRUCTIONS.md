# Push instructions

Local commit is ready. Remote about.html and blogs.html were accidentally overwritten with PLACEHOLDER.

To fix, from this machine or yours:

```bash
cd /home/workdir/artifacts/emtiaz-front
git push origin master
```

Or if no credentials, force push the 5 files via GitHub UI or:
```bash
# Using GitHub CLI after auth
gh auth login
git push origin master
```
