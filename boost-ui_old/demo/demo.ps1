Invoke-WebRequest -Uri "http://localhost:4000/api/reset"
Invoke-WebRequest -Uri "http://localhost:4000/api/addnode?name=Client&group=1"
Start-Sleep -s 2

Invoke-WebRequest -Uri "http://localhost:4000/api/addnode?name=Proxy_1&group=2&parent=Client&distance=15&workload=1"
Start-Sleep -s 2

Invoke-WebRequest -Uri "http://localhost:4000/api/addnode?name=Web&group=3&parent=Proxy_1&distance=10&workload=1"
Start-Sleep -s 2

Invoke-WebRequest -Uri "http://localhost:4000/api/updatelink?from=Client&to=Proxy_1&distance=10&workload=3"
Invoke-WebRequest -Uri "http://localhost:4000/api/updatelink?from=Proxy_1&to=Web&distance=10&workload=3"

Start-Sleep -s 2
Invoke-WebRequest -Uri "http://localhost:4000/api/addnode?name=Proxy_2&group=2"
Start-Sleep -s 1
Invoke-WebRequest -Uri "http://localhost:4000/api/addlink?from=Proxy_1&to=Proxy_2&distance=10&workload=1"
Start-Sleep -s 1
Invoke-WebRequest -Uri "http://localhost:4000/api/addlink?from=Proxy_2&to=Web&distance=10&workload=1"
Start-Sleep -s 1
Invoke-WebRequest -Uri "http://localhost:4000/api/updatelink?from=Client&to=Proxy_1&distance=10&workload=5"
Start-Sleep -s 1