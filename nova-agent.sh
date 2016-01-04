#!/bin/bash

git clone git://github.com/gtmanfred/nova-agent.git /nova-agent
pushd /nova-agent
python setup.py install
install -Dm644 etc/nova-agent.service /etc/systemd/system/nova-agent.service
systemctl daemon-reload
systemctl enable nova-agent
systemctl restart nova-agent
popd
rm -rf /nova-agent
