nextflow.enable.dsl=2

process sub {
    output:
        path "sub.txt", emit: output1
    script:
    """
    echo "process sub output" >> sub.txt
    """
}