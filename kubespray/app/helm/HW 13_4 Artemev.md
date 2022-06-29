#### Задание 1: подготовить helm чарт для приложения  
Необходимо упаковать приложение в чарт для деплоя в разные окружения. Требования:  
- каждый компонент приложения деплоится отдельным deployment’ом/statefulset’ом;  
- в переменных чарта измените образ приложения для изменения версии.  

Ссылка: https://github.com/iv-art074/kuber/tree/master/kubespray/app/helm  

#### Задание 2: запустить 2 версии в разных неймспейсах  
Подготовив чарт, необходимо его проверить. Попробуйте запустить несколько копий приложения:  
- одну версию в namespace=app1;  
- вторую версию в том же неймспейсе;  
- третью версию в namespace=app2.  

NS создал:  
```  
iv_art@Pappa:~/kubespray/app/helm$ kubectl apply -f nss.yaml
namespace/app1 created
namespace/app2 created
iv_art@Pappa:~/kubespray/app/helm$ kubectl get ns
NAME              STATUS   AGE
app1              Active   4s
app2              Active   4s
default           Active   106m
kube-node-lease   Active   106m
kube-public       Active   106m
kube-system       Active   106m
```  
Устанавливаем:
```  
# deploy 1

iv_art@Pappa:~/kubespray/app/helm$ helm install my-release-1 . -n=app1
NAME: my-release-1
LAST DEPLOYED: Thu Jun 30 00:11:24 2022
NAMESPACE: app1
STATUS: deployed
REVISION: 1
TEST SUITE: None

#deploy 2

iv_art@Pappa:~/kubespray/app/helm$ helm install my-release-2 . -n=app1 --set version=0.2.0
NAME: my-release-2
LAST DEPLOYED: Thu Jun 30 00:11:44 2022
NAMESPACE: app1
STATUS: deployed
REVISION: 1
TEST SUITE: None

#deploy 3

iv_art@Pappa:~/kubespray/app/helm$ helm install my-release-3 . -n=app2 --set version=0.3.0
NAME: my-release-3
LAST DEPLOYED: Thu Jun 30 00:12:50 2022
NAMESPACE: app2
STATUS: deployed
REVISION: 1
TEST SUITE: None
```  
Итого  
![image](https://user-images.githubusercontent.com/87374285/176458766-741ceb39-9fbf-4f3e-bb5d-16f74207630b.png)


