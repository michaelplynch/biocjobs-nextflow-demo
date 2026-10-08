include {READ_10X_COUNTS} from '../DropletUtils/wrappers/read-10x-counts'


workflow {    
    def meta = [ id: 'pbmc' ]

    ch_input=Channel.of(
    tuple(
        meta,
        file("${params.input}/matrix.mtx"),
        file("${params.input}/barcodes.tsv"),
        file("${params.input}/genes.tsv")
    )
    )

    ch_input.view()
    READ_10X_COUNTS(ch_input,'test')
    READ_10X_COUNTS.out.outfile.view()
}
