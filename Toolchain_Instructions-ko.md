# 툴체인 학습

*다른 언어로 보기: [English](Toolchain_Instructions.md).*

> 참고: 본 툴체인 학습은 이 [튜토리얼](https://developer.ibm.com/recipes/tutorials/deploy-kubernetes-pods-to-the-bluemix-container-service-using-devops-pipelines)을 기초로 작성되었습니다.

1. **Deploy to Bluemix** 버튼을 클릭하여 리포지토리를 사용자의 GitHub 계정으로 가져오십시오.


2. GitHub에서 인증이 이뤄지지 않는 경우, Authorize 버튼이 나타납니다.


3. 리포지토리 가져오기가 완료되면, Bluemix Continuous Delivery 툴체인 설치 과정으로 이동하게 됩니다. Bluemix Continuous Delivery 툴체인은 샘플 리포지토리 내 템플릿에 의해 정의되어 있습니다.

> **주의**: 프로젝트가 이미 가져오기 된 상태라면, 현재 가져오기 된 프로젝트를 IBM의 마스터 브랜치와 동기화하여 사용자의 현재 툴체인에 새로운 빌드를 트리거할 수 있습니다. https://help.github.com/articles/syncing-a-fork/ 에서 리포지토리 동기화 방법에 관한 자세한 내용을 확인하십시오.
> 
> 새로운 툴체인을 생성하고자 한다면, **repository type**을 *clone* 또는 *existing*으로 변경해야 합니다. 


4. Create 버튼을 클릭하십시오. 생성되는 툴체인은 아래 그림과 같습니다:

![toolchain](images/toolchain.png)

5. 툴체인 뷰에서 Delivery Pipeline 타일을 선택하여 파이프라인 단계 뷰를 여십시오.


6. 파이프라인은 생성된 즉시 실행됩니다. 인증을 위한 사용자의 계정 정보가 누락되어 있으므로 Deploy 단계는 최초 실행 시 실패합니다. Deploy 단계에서 우측 상단 구석의 설정 아이콘을 클릭하고 Configure Stage를 선택하십시오.

![deploy](images/toolchain-deploy.png)

7. 다음 환경 속성들을 설정하십시오

    BLUEMIX_USER – 블루믹스 사용자 ID.
    
    BLUEMIX_PASSWORD – 블루믹스 암호.
    
    BLUEMIX_ACCOUNT – 클러스터를 생성했던 블루믹스 계정의 GUID. `bx iam accounts`로 검색할 수 있습니다.
    
    CLUSTER_NAME – 클러스터 이름. `bx cs clusters`로 검색할 수 있습니다.

    API_KEY (선택사항) - API_KEY는 사용자 계정 로그인 시 사용되며, 블루믹스 CLI를 통해 블루믹스 사용자 이름과 암호로 로그인할 수 없는 **Federated ID**에 사용할 것을 권장합니다. **Create API key**를 클릭하면 https://console.ng.bluemix.net/iam/#/apikeys 에서 API_KEY를 획득할 수 있습니다(각 API 키는 단 일회 확인 가능). 

> 참고: **Federated ID**는 기업이 블루믹스에서 인증 시 연합 ID를 이용한다는 뜻입니다.
   
![env](images/env-example.png)

8. Deploy 단계 카드의 우측 상단에 있는 Run Stage 버튼을 이용하여 Deploy 단계를 실행하십시오. Deploy 단계가 성공하고 애플리케이션이 구축됩니다.
    
![run](images/deploy-run.png)

9. Deploy 단계의 **View logs and history**를 클릭하여 애플리케이션의 URL을 검색하십시오.


10. 축하합니다, URL 링크를 클릭하면 브라우저에 애플리케이션이 로딩됩니다. 참고로, Pod 배포 후 몇 초가 지나야 Pod에서 요청 처리를 시작할 수 있습니다.
