include {READ_10X_COUNTS} from '../DropletUtils/wrappers/read-10x-counts'


workflow {    
    def meta = [ id: 'pbmc' ]

    ch_input=Channel.of(
    tuple(
        meta,
        file("${params.input}/matrix.mtx.gz"),
        file("${params.input}/barcodes.tsv.gz"),
        file("${params.input}/features.tsv.gz"),
        file("${params.input}/sce.h5")
        )
    )

    ch_input.view()
    READ_10X_COUNTS(ch_input,'mtx','test')
    //READ_10X_COUNTS.out.outfile.view()
}
