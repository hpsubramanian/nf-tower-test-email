process ECHO {
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