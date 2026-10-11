resource "google_discovery_engine_data_store" "discovery_engine_data_stores" {
  for_each = var.discovery_engine_data_stores

  data_store_id                = each.value.data_store_id
  display_name                 = each.value.display_name
  industry_vertical            = each.value.industry_vertical
  location                     = each.value.location
  acl_enabled                  = each.value.acl_enabled
  content_config               = each.value.content_config
  create_advanced_site_search  = each.value.create_advanced_site_search
  deletion_policy              = each.value.deletion_policy
  kms_key_name                 = each.value.kms_key_name
  project                      = each.value.project
  skip_default_schema_creation = each.value.skip_default_schema_creation
  solution_types               = each.value.solution_types

  dynamic "advanced_site_search_config" {
    for_each = each.value.advanced_site_search_config != null ? [each.value.advanced_site_search_config] : []
    content {
      disable_automatic_refresh = advanced_site_search_config.value.disable_automatic_refresh
      disable_initial_index     = advanced_site_search_config.value.disable_initial_index
    }
  }

  dynamic "document_processing_config" {
    for_each = each.value.document_processing_config != null ? [each.value.document_processing_config] : []
    content {
      dynamic "chunking_config" {
        for_each = document_processing_config.value.chunking_config != null ? [document_processing_config.value.chunking_config] : []
        content {
          dynamic "layout_based_chunking_config" {
            for_each = chunking_config.value.layout_based_chunking_config != null ? [chunking_config.value.layout_based_chunking_config] : []
            content {
              chunk_size                = layout_based_chunking_config.value.chunk_size
              include_ancestor_headings = layout_based_chunking_config.value.include_ancestor_headings
            }
          }
        }
      }
      dynamic "default_parsing_config" {
        for_each = document_processing_config.value.default_parsing_config != null ? [document_processing_config.value.default_parsing_config] : []
        content {
          dynamic "digital_parsing_config" {
            for_each = default_parsing_config.value.digital_parsing_config != null ? [default_parsing_config.value.digital_parsing_config] : []
            content {
            }
          }
          dynamic "layout_parsing_config" {
            for_each = default_parsing_config.value.layout_parsing_config != null ? [default_parsing_config.value.layout_parsing_config] : []
            content {
              enable_get_processed_document = layout_parsing_config.value.enable_get_processed_document
              enable_image_annotation       = layout_parsing_config.value.enable_image_annotation
              enable_llm_layout_parsing     = layout_parsing_config.value.enable_llm_layout_parsing
              enable_table_annotation       = layout_parsing_config.value.enable_table_annotation
              exclude_html_classes          = layout_parsing_config.value.exclude_html_classes
              exclude_html_elements         = layout_parsing_config.value.exclude_html_elements
              exclude_html_ids              = layout_parsing_config.value.exclude_html_ids
              structured_content_types      = layout_parsing_config.value.structured_content_types
            }
          }
          dynamic "ocr_parsing_config" {
            for_each = default_parsing_config.value.ocr_parsing_config != null ? [default_parsing_config.value.ocr_parsing_config] : []
            content {
              use_native_text = ocr_parsing_config.value.use_native_text
            }
          }
        }
      }
      dynamic "parsing_config_overrides" {
        for_each = document_processing_config.value.parsing_config_overrides != null ? document_processing_config.value.parsing_config_overrides : []
        content {
          dynamic "digital_parsing_config" {
            for_each = parsing_config_overrides.value.digital_parsing_config != null ? [parsing_config_overrides.value.digital_parsing_config] : []
            content {
            }
          }
          file_type = parsing_config_overrides.value.file_type
          dynamic "layout_parsing_config" {
            for_each = parsing_config_overrides.value.layout_parsing_config != null ? [parsing_config_overrides.value.layout_parsing_config] : []
            content {
              enable_get_processed_document = layout_parsing_config.value.enable_get_processed_document
              enable_image_annotation       = layout_parsing_config.value.enable_image_annotation
              enable_llm_layout_parsing     = layout_parsing_config.value.enable_llm_layout_parsing
              enable_table_annotation       = layout_parsing_config.value.enable_table_annotation
              exclude_html_classes          = layout_parsing_config.value.exclude_html_classes
              exclude_html_elements         = layout_parsing_config.value.exclude_html_elements
              exclude_html_ids              = layout_parsing_config.value.exclude_html_ids
              structured_content_types      = layout_parsing_config.value.structured_content_types
            }
          }
          dynamic "ocr_parsing_config" {
            for_each = parsing_config_overrides.value.ocr_parsing_config != null ? [parsing_config_overrides.value.ocr_parsing_config] : []
            content {
              use_native_text = ocr_parsing_config.value.use_native_text
            }
          }
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

