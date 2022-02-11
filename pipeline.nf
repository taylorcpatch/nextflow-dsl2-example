nextflow.enable.dsl=2

include { foo } from './modules/module-a/pipeline.nf'
include { bar } from './modules/module-b/pipeline.nf'

workflow platform_workflow {
    main:
        foo()
        bar(foo.out.output1, foo.out.output2)
}

workflow {
    platform_workflow()
}
