nextflow.enable.dsl=2

include { sub } from './modules/submodule.nf'

process a {
    output:
        path "a.txt", emit: output2
    script:
    """
    echo "process a output" >> a.txt
    """
}
workflow foo {

    main:
        sub()
        a()

    emit:
        output1 = sub.out.output1
        output2 = a.out.output2
}