process ECHO {
    container "public.ecr.aws/aws-cli/aws-cli"

    input:
    val(x)

    output:
    stdout

    """
    aws s3 cp '${x}' ./
    """
}

 
workflow {
    println params.x
    ECHO(params.x)
 
}
