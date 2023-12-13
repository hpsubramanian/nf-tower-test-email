process ECHO {
    container "${ workflow.containerEngine == 'singularity' && !task.ext.singularity_pull_docker_container ?
        'https://depot.galaxyproject.org/singularity/python:3.8.3' :
        'biocontainers/python:3.8.3' }"

    input:
    val x

    output:
    stdout

    """
    #!/usr/bin/env python
    print('${x}')
    """
}

 
workflow {
    println params.email
    ECHO(Channel.of("Hello World")) | view { "I say... $it" }
 
}

workflow.onComplete {
    sendMail(
        to: params.email,
        subject: 'Pipeline completed',
        body: 'Test email from Nextflow',
    )
}