echo "[TASK 1] Installation of python 3.13"
dnf install python3.13 -y
echo "[TASK 2] Installation of pip module"
python3.13 -m ensurepip
echo "[TASK 3] Upgrade pip version"
python3.13 -m pip install --upgrade pip
echo "[TASK 4] Install ansible"
python3.13 -m pip install ansible
echo "[TASK 5] Install passlib for user creation ansibles"
python3.13 -m pip install passlib
echo "[TASK 6] Pull ansible role for user creation"
ansible-galaxy role install hemanth22.createuser

