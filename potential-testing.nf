nextflow.enable.dsl=2

include { a } from './modules/module-a/pipeline.nf'
params.expected_a_output = './test_files/expected_a_output.txt'

process check_a_output {
    input:
        file(a_output)
        file(expected_a_output)
    output:
        env STATUS
    script:
    """
    # Run some checking of the output file/value here
    N_DIF_LINES=\$(diff ${a_output} ${expected_a_output} | wc -l)
    if [ \$N_DIF_LINES -eq 0 ]
    then
        status=1
    else
        status=0
    fi
    export STATUS=\$status
    """
}

workflow {
    main:
        a()
        check_a_output(a.out.output2, params.expected_a_output)
        check_a_output.out.view()
        // here could envision something that would loop all these checks and report passing/failing.
        // (this has not been fully thought out just thinking in code here)
}
