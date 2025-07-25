def call(List scripts) {
    scripts.each { script ->
        sh "chmod +x ./${script}"
    }
}
