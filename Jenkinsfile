pipeline {
  agent any
  node {
    git url: 'https://github.com/mishraa2712/testdemo.git', branch: 'b1'
    def mvnHome = tool 'M3'
    bat "${mvnHome}\\bin\\mvn -B verify"
  }
}
