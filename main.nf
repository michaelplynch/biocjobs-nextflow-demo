include {READ_10X_COUNTS_MTX} from '../DropletUtils/wrappers/read-10x-counts-mtx'


workflow {    
    def meta = [ id: 'pbmc' ]

    ch_input=Channel.of(
    tuple(
        meta,
        file("${params.input}/matrix.mtx.gz"),
        file("${params.input}/barcodes.tsv.gz"),
        file("${params.input}/features.tsv.gz")
        )
    )

    ch_input.view()
    READ_10X_COUNTS_MTX(ch_input,'test')
    //READ_10X_COUNTS.out.outfile.view()
}
