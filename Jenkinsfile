template = '''
apiVersion: v1
kind: Pod
metadata:
  labels:
    run: kubernetes
  name: kubernetes
spec:
  containers:
  - image: kaizenacademy/command:4.0
    name: kubernetes
'''

properties([
    parameters([
        choice(choices: ['apply', 'destroy'], description: 'Pick the action', name: 'action')
        ])
        ])

podTemplate(cloud: 'kubernetes', label: 'kubernetes', yaml: template) {
    node("kubernetes") {
        container("kubernetes") {
            stage("Checkout SCM") {
                git branch: 'main', url: 'https://github.com/Beishenov7/project.git'
            }
            withCredentials([file(credentialsId: 'gcp-creds', variable: 'GOOGLE_APPLICATION_CREDENTIALS')]) {
                stage("Init") {
                    sh """
                        cd terraform-apps
                        terraform init
                        gcloud auth activate-service-account --key-file=${GOOGLE_APPLICATION_CREDENTIALS}
                        gcloud container clusters get-credentials cluster-1 --zone us-central1-c --project horizontal-tube-424123-a0
                    """
                }
                if(params.action == "apply") {
                stage("Apply") {
                    sh """
                    cd terraform-apps
                    terraform apply --auto-approve
                    """
                }
                }
                else {
                stage("Destroy") {
                    sh """
                    cd terraform-apps
                    terraform destroy --auto-approve
                    """
                }
                }
            }
        }
    }
}
