# 툴체인 학습

*다른 언어로 보기: [English](Toolchain_Instructions_new.md).*

> 참고: 본 툴체인 학습은 이 [튜토리얼](https://developer.ibm.com/recipes/tutorials/deploy-kubernetes-pods-to-the-bluemix-container-service-using-devops-pipelines)을 기초로 작성되었습니다.

1. **Deploy to Bluemix** 버튼을 클릭하십시오.

2. GitHub에서 인증이 이뤄지지 않는 경우, Authorize 버튼이 나타납니다.

3. **Delivery Pipeline**을 클릭하고 create 버튼을 클릭하기전에 선택 사항이 아닌 모든 환경 변수를 입력 하십시오.

> 정보 버튼을 클릭하여 각각의 환경 변수에 대한 추가 정보를 확인 할 수 있습니다.

![Delivery Pipeline](images/delivery.png)

다음은 쿠버네티스에 애플리케이션 배포를 위한 공통적인 환경 변수입니다.

- Bluemix API Key (선택사항) - API Key는 사용자 계정 로그인 시 사용되며, 블루믹스 CLI를 통해 블루믹스 사용자 이름과 암호로 로그인할 수 없는 **Federated ID**에 사용할 것을 권장합니다. **Create API key**를 클릭하면 https://console.ng.bluemix.net/iam/#/apikeys 에서 API_KEY를 획득할 수 있습니다(각 API 키는 단 일회 확인 가능). 

> 참고: **Federated ID**는 기업이 블루믹스에서 인증 시 연합 ID를 이용한다는 뜻입니다.
>
> Bluemix API Key 속성을 입력했다면, **Bluemix User ID**, **Password**, 및 **Cluster Account ID** 속성은 공백으로 둘 수 있습니다.

- Bluemix User ID– 블루믹스 사용자 ID. 

- Bluemix Password – 블루믹스 암호. 

- Bluemix Cluster Account ID – 클러스터를 생성했던 블루믹스 계정의 GUID. `bx iam accounts`로 검색할 수 있습니다.

- Bluemix Cluster Name – 클러스터 이름. `bx cs clusters`로 검색할 수 있습니다.

4. 환경 변수를 입력 후에 **CREATE** 버튼을 클릭하십시오. GitHub에 리포지토리 복제가 완료되었면, Bluemix Continuous Delivery 툴체인 설치 과정으로 이동하게 됩니다. 

![toolchain](images/toolchain.png)

5. 툴체인 뷰에서 Delivery Pipeline 타일을 선택하여 파이프라인 단계 뷰를 여십시오.

6. Deploy 단계의 **View logs and history**를 클릭하여 애플리케이션의 URL/Endpoint를 검색하십시오.

7. 축하합니다, URL 링크를 클릭하면 브라우저에 웹 애플리케이션이 로딩됩니다. 다른 애플리케이션들은, 로그의 마지막에서 애플리케이션 Endpoint를 찾을 수 있습니다. 참고로, Pod 배포 후 몇 초가 지나야 Pod에서 요청 처리를 시작할 수 있습니다.
