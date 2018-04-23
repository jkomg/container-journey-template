[![Build Status](https://travis-ci.org/IBM/container-journey-template.svg?branch=master)](https://travis-ci.org/IBM/container-journey-template)

# Container Journey template - 쿠버네티스(Kubernetes) 클러스터 생성하기

*다른 언어로 보기: [English](README.md).*

이 곳에 소개된 시나리오는 다음 작업들을 진행하기 위해 제공되었습니다:
- Bluemix CLI와 연관된 리포지토리 설치하기
- 쿠버네티스 API 사용을 위한 CLI 설치하기
- 한 개의 작업자 노드로 쿠버네티스 클러스터 생성하기


## 1단계. Bluemix CLI 설정

IBM 블루믹스 컨테이너 서비스 CLI, 이미지 레지스트리 CLI, 해당 필수 구성요소 등을 설치하십시오. CLI는 추후 학습에서도 사용되며, 로컬 컴퓨터에서 쿠버네티스 클러스터를 관리하고, 컨테이너로 구축할 이미지를 생성하며, 추후 튜토리얼에서 클러스터에 앱을 구축할 때 필요합니다. 

1. [블루믹스 계정](https://console.ng.bluemix.net/registration/)이 없다면 신규로 만들어야 합니다. 사용자 이름과 암호는 추후에 필요하므로 메모해 놓으시기 바랍니다. 

> **Linux** 사용자의 경우라면, 이 리포지토리를 복사한 뒤, `bash linux.sh`를 실행할 수 있습니다. 그런 다음, [2단계](#2단계-클러스터-환경-설치하기)로 이동합니다.

2. [블루믹스 CLI](http://clis.ng.bluemix.net/ui/home.html)를 블루믹스 컨테이너 서비스 플러그인의 필수 구성요소로 설치하십시오. 블루믹스 CLI를 사용하여 명령을 실행할 때 필요한 접두부는 bx입니다.

> **Mac** 사용자의 경우, 블루믹스 CLI 설치 후에 이 리포지토리를 복사한 뒤, 터미널에서 `bash osx.sh`를 실행하십시오. 그런 다음, [2단계](#2단계-클러스터-환경-설치하기)로 이동합니다.


3. 블루믹스 CLI에 로그인하십시오.
    ```bash
    $ bx login -a https://api.ng.bluemix.net
    ```

4. 프롬프트의 안내에 따라 로그인할 계정과 공간을 선택하십시오:
    ```bash
    $ bx login -a https://api.ng.bluemix.net
    API endpoint: https://api.ng.bluemix.net

    Email> myemail@email.com

    Password>
    Authenticating...
    OK

    Select an account (or press enter to skip):
    1. Stuff (8b05eb34e24005a6a1f9ba77f565fe2d)
    Enter a number> 1  (note that not entering a number will cause this to fail)
    Targeted account Stuff (8b05eb34e24005a6a1f9ba77f565fe2d)

    Targeted org test.org

    Targeted space test

    API endpoint:   https://api.ng.bluemix.net (API version: 2.75.0)
    Region:         us-south
    User:           myemail.email.com
    Account:        Stuff (8b05eb34e24005a6a1f9ba77f565fe2d)
    Org:            test.org
    Space:          test
    ```

5. 쿠버네티스 클러스터 생성과 작업자 노드 관리를 위해 블루믹스 컨테이너 서비스 플러그인을 설치하십시오. 블루믹스 컨테이너 서비스 플러그인을 사용하여 명령을 실행할 때 필요한 접두부는 `bx cs`입니다.
    ```bash
    $ bx plugin repo-add Bluemix https://plugins.ng.bluemix.net
    $ bx plugin install container-service -r Bluemix
    ```

6. 블루믹스 컨테이너 서비스 플러그인을 초기화하십시오.
    ```bash
    $ bx cs init
    ```

7. 쿠버네티스 대시보드의 로컬 버전을 확인하고, 클러스터에 앱을 구축하기 위해 [쿠버네티스 CLI](https://kubernetes.io/docs/user-guide/prereqs/)를 설치합니다. 쿠버네티스 CLI를 사용하여 명령을 실행할 때 필요한 접두부는 kubectl입니다.

    **a. 쿠버네티스 CLI를 다운로드 하십시오.**

    OS X: http://storage.googleapis.com/kubernetes-release/release/v1.5.3/bin/darwin/amd64/kubectl

    Linux: http://storage.googleapis.com/kubernetes-release/release/v1.5.3/bin/linux/amd64/kubectl

    Windows: http://storage.googleapis.com/kubernetes-release/release/v1.5.3/bin/windows/amd64/kubectl.exe

    **b. OSX 및 Linux 사용자의 경우, 바이너리 파일을 실행 파일로 변환하십시오.**

    ```bash
    $ chmod +x kubectl
    ```
    /usr/local/bin이 사용자의 시스템 변수 PATH에 존재해야 합니다. PATH 변수에는 사용자 운영체제가 실행 파일을 찾을 수 있는 디렉토리 전체가 포함되어 있습니다. PATH 변수에 나열되어 있는 디렉토리들은 저마다 다른 용도로 사용됩니다. 운영체제의 일부가 아닌 /usr/local/bin은 시스템 관리자가 수동으로 설치한 소프트웨어의 실행 파일을 저장하는 데 사용됩니다.

    ```bash
    $ echo $PATH
    /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
    ```
    실행 파일을 /usr/local/bin 디렉토리로 이동합니다
    ```bash
    $ sudo mv kubectl /usr/local/bin/kubectl
    ```

축하합니다! 블루믹스 계정 생성에 성공하셨습니다. 아울러, 추후 학습과 튜토리얼에 필요한 CLI 설치도 성공적으로 완료되었습니다. 이제, CLI를 이용하여 클러스터에 접속하십시오.

## 2단계: 클러스터 환경 설치하기

1. 쿠버네티스 클러스터를 무료로 생성하십시오
    ```bash
    $ bx cs cluster-create --name [your_cluster_name]
    ```
    무료 클러스터가 컨테이너 pod의 구축 기반이 되는 한 개의 작업자 노드와 함께 제공됩니다. 작업자 노드는 pod이 실행되는 컴퓨팅 호스트로서 주로 가상 머신이 이에 해당됩니다. 하나의 pod에는 하나 이상의 컨테이너들과 이를 위한 공유 저장소 그리고 선택적으로 컨테이너들의 실행 방법에 대한 정보가 담겨 있습니다. pod의 모델은 "애플리케이션에 특정한 논리 호스트"로서, 상대적으로 강하게 결합되어 있는 하나 또는 그 이상의 애플리케이션 컨테이너들을 포함합니다.

> **참고:** 작업자 노드용 머신 주문과 클러스터 설치 및 프로비저닝에는 최대 2시간이 소요됩니다.

2. 다음 단계로 이동하기에 앞서, 작업자 노드 구축이 완전히 완료되었는지 확인하십시오.
    ```bash
    $ bx cs workers [your_cluster_name]
    ID                                           Public IP       Private IP    Machine Type  State     Status   
    dal10-pa8dfcc5223804439c87489886dbbc9c07-w1  169.47.223.113  10.171.42.93  free         deployed  Deploy Automation                                          Successful   
    ```

3. CLI로 클러스터에 대한 컨텍스트를 설정하십시오. 워드프레스 작업을 위해 IBM 블루믹스 컨테이너 서비스 CLI에 로그인할 때마다 이 명령들을 실행하여 클러스터 설정 파일 경로를 세션 변수로 설정하십시오. 쿠버네티스 CLI는 이 세션 변수를 이용하여 블루믹스의 클러스터와 연결하는 데 필요한 로컬 설정 파일과 인증서를 찾습니다.

    a. pr_firm_cluster 클러스터에서 사용할 설정 파일과 인증서를 다운로드 하십시오.
    ```bash
    $ bx cs cluster-config [your_cluster_name]
    export KUBECONFIG=/Users/ibm/.bluemix/plugins/cs-cli/clusters/wordpress/kube-config-dal10-wordpress.yml
    ```
    
    b. 이전 단계의 명령을 복사, 붙여넣기 하여 KUBECONFIG 환경 변수를 설정하고, CLI를 설정하여 클러스터에 대하여 kubectl 명령을 실행하십시오.

4. 이제, 앞서 bx cs workers 명령에 대응하는 kubectl 명령을 실행하여 쿠버네티스 비밀키가 동작하는지 확인해 볼 수 있습니다:
    ```bash
    $ kubectl get nodes
    NAME             STATUS    AGE       VERSION
    184.172.242.18   Ready     3h        v1.5.6-4+abe34653415733
    ```
    
수고하셨습니다! 클러스터의 생성, 설정 및 로컬 환경이 준비되어 클러스터 내에 앱을 배포할 수 있습니다. 정말로 정상적으로 실행 되는지 확인하기 위해, 간단한 도커 예제인 hello-world 컨테이너 앱을 새로 생성한 클러스터에서 실행해 봅시다.
   
    $ kubectl run -i --tty hw --image=hello-world --restart=Never
   
    Hello from Docker!
    This message shows that your installation appears to be working correctly.
    
    To generate this message, Docker took the following steps:
    1. The Docker client contacted the Docker daemon.
    2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
    4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.
    
    To try something more ambitious, you can run an Ubuntu container with:
    $ docker run -it ubuntu bash
    
    Share images, automate workflows, and more with a free Docker ID:
    https://cloud.docker.com/
    
    For more examples and ideas, visit:
    https://docs.docker.com/engine/userguide/

이제 다 되었습니다, 이제 이 글로 오기 전 과정으로 되돌아 갈 수 있습니다!
