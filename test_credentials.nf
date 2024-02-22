process ECHO {
    container 'cimg/aws:2023.12'

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
