nextflow.enable.dsl=2

process a {
    publishDir "output"
    input:
        file(a)
        file(b)
    output:
        path "c.txt"
    script:
    """
    cat ${a} ${b} > c.txt
    """
}
workflow bar {
    take:
        input_1
        input_2

    main:
        a(input_1, input_2)
}