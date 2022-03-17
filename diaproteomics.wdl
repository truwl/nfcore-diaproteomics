version 1.0

workflow diaproteomics {
	input{
		File samplesheet
		String? input_spectral_library
		String? irts
		String outdir = "./results"
		String? email
		Boolean? generate_spectral_library
		String? input_sheet_dda
		Float library_rt_fdr = 0.01
		Int min_transitions = 4
		Int max_transitions = 6
		String decoy_method = "shuffle"
		Boolean? skip_decoy_generation
		String unimod = "https://raw.githubusercontent.com/nf-core/test-datasets/diaproteomics/unimod.xml"
		Boolean? skip_dia_processing
		Boolean? generate_pseudo_irts
		Int n_irts = 250
		Boolean? irts_from_outer_quantiles
		Boolean? merge_libraries
		Boolean? align_libraries
		Int min_overlap_for_merging = 100
		Int mz_extraction_window = 30
		String mz_extraction_window_unit = "ppm"
		Int mz_extraction_window_ms1 = 10
		String mz_extraction_window_ms1_unit = "ppm"
		Int rt_extraction_window = 600
		Float irt_min_rsq = 0.95
		Int irt_n_bins = 10
		Int irt_min_bins_covered = 8
		String irt_alignment_method = "linear"
		Boolean? force_option
		Boolean use_ms1 = true
		Int? min_upper_edge_dist
		String cache_option = "normal"
		String pyprophet_classifier = "LDA"
		String pyprophet_fdr_ms_level = "ms1ms2"
		String? pyprophet_global_fdr_level
		Float pyprophet_peakgroup_fdr = 0.01
		Float pyprophet_peptide_fdr = 0.01
		Float pyprophet_protein_fdr = 0.01
		Float pyprophet_pi0_start = 0.1
		Float pyprophet_pi0_end = 0.5
		Float pyprophet_pi0_steps = 0.05
		Float dialignr_global_align_fdr = 0.01
		Float dialignr_analyte_fdr = 0.01
		Float dialignr_unalign_fdr = 0.01
		Float dialignr_align_fdr = 0.05
		Float dialignr_query_fdr = 0.05
		String dialignr_xicfilter = "sgolay"
		Boolean dialignr_parallelization = true
		Boolean run_msstats = true
		Boolean generate_plots = true
		Boolean? mztab_export
		Boolean? help
		String publish_dir_mode = "copy"
		Boolean validate_params = true
		String? email_on_fail
		Boolean? plaintext_email
		Boolean? monochrome_logs
		String tracedir = "./results/pipeline_info"
		Boolean? show_hidden_params
		Int max_cpus = 16
		String max_memory = "128.GB"
		String max_time = "240.h"
		String custom_config_version = "master"
		String custom_config_base = "https://raw.githubusercontent.com/nf-core/configs/master"
		String? hostnames
		String? config_profile_name
		String? config_profile_description
		String? config_profile_contact
		String? config_profile_url

	}

	call make_uuid as mkuuid {}
	call touch_uuid as thuuid {
		input:
			outputbucket = mkuuid.uuid
	}
	call run_nfcoretask as nfcoretask {
		input:
			samplesheet = samplesheet,
			input_spectral_library = input_spectral_library,
			irts = irts,
			outdir = outdir,
			email = email,
			generate_spectral_library = generate_spectral_library,
			input_sheet_dda = input_sheet_dda,
			library_rt_fdr = library_rt_fdr,
			min_transitions = min_transitions,
			max_transitions = max_transitions,
			decoy_method = decoy_method,
			skip_decoy_generation = skip_decoy_generation,
			unimod = unimod,
			skip_dia_processing = skip_dia_processing,
			generate_pseudo_irts = generate_pseudo_irts,
			n_irts = n_irts,
			irts_from_outer_quantiles = irts_from_outer_quantiles,
			merge_libraries = merge_libraries,
			align_libraries = align_libraries,
			min_overlap_for_merging = min_overlap_for_merging,
			mz_extraction_window = mz_extraction_window,
			mz_extraction_window_unit = mz_extraction_window_unit,
			mz_extraction_window_ms1 = mz_extraction_window_ms1,
			mz_extraction_window_ms1_unit = mz_extraction_window_ms1_unit,
			rt_extraction_window = rt_extraction_window,
			irt_min_rsq = irt_min_rsq,
			irt_n_bins = irt_n_bins,
			irt_min_bins_covered = irt_min_bins_covered,
			irt_alignment_method = irt_alignment_method,
			force_option = force_option,
			use_ms1 = use_ms1,
			min_upper_edge_dist = min_upper_edge_dist,
			cache_option = cache_option,
			pyprophet_classifier = pyprophet_classifier,
			pyprophet_fdr_ms_level = pyprophet_fdr_ms_level,
			pyprophet_global_fdr_level = pyprophet_global_fdr_level,
			pyprophet_peakgroup_fdr = pyprophet_peakgroup_fdr,
			pyprophet_peptide_fdr = pyprophet_peptide_fdr,
			pyprophet_protein_fdr = pyprophet_protein_fdr,
			pyprophet_pi0_start = pyprophet_pi0_start,
			pyprophet_pi0_end = pyprophet_pi0_end,
			pyprophet_pi0_steps = pyprophet_pi0_steps,
			dialignr_global_align_fdr = dialignr_global_align_fdr,
			dialignr_analyte_fdr = dialignr_analyte_fdr,
			dialignr_unalign_fdr = dialignr_unalign_fdr,
			dialignr_align_fdr = dialignr_align_fdr,
			dialignr_query_fdr = dialignr_query_fdr,
			dialignr_xicfilter = dialignr_xicfilter,
			dialignr_parallelization = dialignr_parallelization,
			run_msstats = run_msstats,
			generate_plots = generate_plots,
			mztab_export = mztab_export,
			help = help,
			publish_dir_mode = publish_dir_mode,
			validate_params = validate_params,
			email_on_fail = email_on_fail,
			plaintext_email = plaintext_email,
			monochrome_logs = monochrome_logs,
			tracedir = tracedir,
			show_hidden_params = show_hidden_params,
			max_cpus = max_cpus,
			max_memory = max_memory,
			max_time = max_time,
			custom_config_version = custom_config_version,
			custom_config_base = custom_config_base,
			hostnames = hostnames,
			config_profile_name = config_profile_name,
			config_profile_description = config_profile_description,
			config_profile_contact = config_profile_contact,
			config_profile_url = config_profile_url,
			outputbucket = thuuid.touchedbucket
            }
		output {
			Array[File] results = nfcoretask.results
		}
	}
task make_uuid {
	meta {
		volatile: true
}

command <<<
        python <<CODE
        import uuid
        print("gs://truwl-internal-inputs/nf-diaproteomics/{}".format(str(uuid.uuid4())))
        CODE
>>>

  output {
    String uuid = read_string(stdout())
  }
  
  runtime {
    docker: "python:3.8.12-buster"
  }
}

task touch_uuid {
    input {
        String outputbucket
    }

    command <<<
        echo "sentinel" > sentinelfile
        gsutil cp sentinelfile ~{outputbucket}/sentinelfile
    >>>

    output {
        String touchedbucket = outputbucket
    }

    runtime {
        docker: "google/cloud-sdk:latest"
    }
}

task fetch_results {
    input {
        String outputbucket
        File execution_trace
    }
    command <<<
        cat ~{execution_trace}
        echo ~{outputbucket}
        mkdir -p ./resultsdir
        gsutil cp -R ~{outputbucket} ./resultsdir
    >>>
    output {
        Array[File] results = glob("resultsdir/*")
    }
    runtime {
        docker: "google/cloud-sdk:latest"
    }
}

task run_nfcoretask {
    input {
        String outputbucket
		File samplesheet
		String? input_spectral_library
		String? irts
		String outdir = "./results"
		String? email
		Boolean? generate_spectral_library
		String? input_sheet_dda
		Float library_rt_fdr = 0.01
		Int min_transitions = 4
		Int max_transitions = 6
		String decoy_method = "shuffle"
		Boolean? skip_decoy_generation
		String unimod = "https://raw.githubusercontent.com/nf-core/test-datasets/diaproteomics/unimod.xml"
		Boolean? skip_dia_processing
		Boolean? generate_pseudo_irts
		Int n_irts = 250
		Boolean? irts_from_outer_quantiles
		Boolean? merge_libraries
		Boolean? align_libraries
		Int min_overlap_for_merging = 100
		Int mz_extraction_window = 30
		String mz_extraction_window_unit = "ppm"
		Int mz_extraction_window_ms1 = 10
		String mz_extraction_window_ms1_unit = "ppm"
		Int rt_extraction_window = 600
		Float irt_min_rsq = 0.95
		Int irt_n_bins = 10
		Int irt_min_bins_covered = 8
		String irt_alignment_method = "linear"
		Boolean? force_option
		Boolean use_ms1 = true
		Int? min_upper_edge_dist
		String cache_option = "normal"
		String pyprophet_classifier = "LDA"
		String pyprophet_fdr_ms_level = "ms1ms2"
		String? pyprophet_global_fdr_level
		Float pyprophet_peakgroup_fdr = 0.01
		Float pyprophet_peptide_fdr = 0.01
		Float pyprophet_protein_fdr = 0.01
		Float pyprophet_pi0_start = 0.1
		Float pyprophet_pi0_end = 0.5
		Float pyprophet_pi0_steps = 0.05
		Float dialignr_global_align_fdr = 0.01
		Float dialignr_analyte_fdr = 0.01
		Float dialignr_unalign_fdr = 0.01
		Float dialignr_align_fdr = 0.05
		Float dialignr_query_fdr = 0.05
		String dialignr_xicfilter = "sgolay"
		Boolean dialignr_parallelization = true
		Boolean run_msstats = true
		Boolean generate_plots = true
		Boolean? mztab_export
		Boolean? help
		String publish_dir_mode = "copy"
		Boolean validate_params = true
		String? email_on_fail
		Boolean? plaintext_email
		Boolean? monochrome_logs
		String tracedir = "./results/pipeline_info"
		Boolean? show_hidden_params
		Int max_cpus = 16
		String max_memory = "128.GB"
		String max_time = "240.h"
		String custom_config_version = "master"
		String custom_config_base = "https://raw.githubusercontent.com/nf-core/configs/master"
		String? hostnames
		String? config_profile_name
		String? config_profile_description
		String? config_profile_contact
		String? config_profile_url

	}
	command <<<
		export NXF_VER=21.10.5
		export NXF_MODE=google
		echo ~{outputbucket}
		/nextflow -c /truwl.nf.config run /diaproteomics-1.2.4  -profile truwl  --input ~{samplesheet} 	~{"--samplesheet " + samplesheet}	~{"--input_spectral_library " + input_spectral_library}	~{"--irts " + irts}	~{"--outdir " + outdir}	~{"--email " + email}	~{true="--generate_spectral_library  " false="" generate_spectral_library}	~{"--input_sheet_dda " + input_sheet_dda}	~{"--library_rt_fdr " + library_rt_fdr}	~{"--min_transitions " + min_transitions}	~{"--max_transitions " + max_transitions}	~{"--decoy_method " + decoy_method}	~{true="--skip_decoy_generation  " false="" skip_decoy_generation}	~{"--unimod " + unimod}	~{true="--skip_dia_processing  " false="" skip_dia_processing}	~{true="--generate_pseudo_irts  " false="" generate_pseudo_irts}	~{"--n_irts " + n_irts}	~{true="--irts_from_outer_quantiles  " false="" irts_from_outer_quantiles}	~{true="--merge_libraries  " false="" merge_libraries}	~{true="--align_libraries  " false="" align_libraries}	~{"--min_overlap_for_merging " + min_overlap_for_merging}	~{"--mz_extraction_window " + mz_extraction_window}	~{"--mz_extraction_window_unit " + mz_extraction_window_unit}	~{"--mz_extraction_window_ms1 " + mz_extraction_window_ms1}	~{"--mz_extraction_window_ms1_unit " + mz_extraction_window_ms1_unit}	~{"--rt_extraction_window " + rt_extraction_window}	~{"--irt_min_rsq " + irt_min_rsq}	~{"--irt_n_bins " + irt_n_bins}	~{"--irt_min_bins_covered " + irt_min_bins_covered}	~{"--irt_alignment_method " + irt_alignment_method}	~{true="--force_option  " false="" force_option}	~{true="--use_ms1  " false="" use_ms1}	~{"--min_upper_edge_dist " + min_upper_edge_dist}	~{"--cache_option " + cache_option}	~{"--pyprophet_classifier " + pyprophet_classifier}	~{"--pyprophet_fdr_ms_level " + pyprophet_fdr_ms_level}	~{"--pyprophet_global_fdr_level " + pyprophet_global_fdr_level}	~{"--pyprophet_peakgroup_fdr " + pyprophet_peakgroup_fdr}	~{"--pyprophet_peptide_fdr " + pyprophet_peptide_fdr}	~{"--pyprophet_protein_fdr " + pyprophet_protein_fdr}	~{"--pyprophet_pi0_start " + pyprophet_pi0_start}	~{"--pyprophet_pi0_end " + pyprophet_pi0_end}	~{"--pyprophet_pi0_steps " + pyprophet_pi0_steps}	~{"--dialignr_global_align_fdr " + dialignr_global_align_fdr}	~{"--dialignr_analyte_fdr " + dialignr_analyte_fdr}	~{"--dialignr_unalign_fdr " + dialignr_unalign_fdr}	~{"--dialignr_align_fdr " + dialignr_align_fdr}	~{"--dialignr_query_fdr " + dialignr_query_fdr}	~{"--dialignr_xicfilter " + dialignr_xicfilter}	~{true="--dialignr_parallelization  " false="" dialignr_parallelization}	~{true="--run_msstats  " false="" run_msstats}	~{true="--generate_plots  " false="" generate_plots}	~{true="--mztab_export  " false="" mztab_export}	~{true="--help  " false="" help}	~{"--publish_dir_mode " + publish_dir_mode}	~{true="--validate_params  " false="" validate_params}	~{"--email_on_fail " + email_on_fail}	~{true="--plaintext_email  " false="" plaintext_email}	~{true="--monochrome_logs  " false="" monochrome_logs}	~{"--tracedir " + tracedir}	~{true="--show_hidden_params  " false="" show_hidden_params}	~{"--max_cpus " + max_cpus}	~{"--max_memory " + max_memory}	~{"--max_time " + max_time}	~{"--custom_config_version " + custom_config_version}	~{"--custom_config_base " + custom_config_base}	~{"--hostnames " + hostnames}	~{"--config_profile_name " + config_profile_name}	~{"--config_profile_description " + config_profile_description}	~{"--config_profile_contact " + config_profile_contact}	~{"--config_profile_url " + config_profile_url}	-w ~{outputbucket}
	>>>
        
    output {
        File execution_trace = "pipeline_execution_trace.txt"
        Array[File] results = glob("results/*/*html")
    }
    runtime {
        docker: "truwl/nfcore-diaproteomics:1.2.4_0.1.0"
        memory: "2 GB"
        cpu: 1
    }
}
    