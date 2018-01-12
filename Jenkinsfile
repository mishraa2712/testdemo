pipeline {
  agent any {
    git url: 'https://github.com/mishraa2712/testdemo.git', branch: 'gittestbranch'
    def mvnHome = tool 'M3'
    bat "${mvnHome}\\bin\\mvn -B verify"
  }
}
