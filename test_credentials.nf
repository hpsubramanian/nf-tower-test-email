process ECHO {
    container "${ workflow.containerEngine == 'singularity' && !task.ext.singularity_pull_docker_container ?
        'https://depot.galaxyproject.org/singularity/python:3.8.3' :
        'python:3.8.3' }"

    input:
    val(x)

    output:
    stdout

    """
    aws s3 cp ${x} ./
    """
}

 
workflow {
    println params.x
    ECHO(params.x)
 
}
