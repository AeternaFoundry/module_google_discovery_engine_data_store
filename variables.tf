variable "discovery_engine_data_stores" {
  description = <<EOT
Map of discovery_engine_data_stores, attributes below
Required:
    - data_store_id
    - display_name
    - industry_vertical
    - location
Optional:
    - acl_enabled
    - content_config
    - create_advanced_site_search
    - deletion_policy
    - kms_key_name
    - project
    - skip_default_schema_creation
    - solution_types
    - advanced_site_search_config (block):
        - disable_automatic_refresh (optional)
        - disable_initial_index (optional)
    - document_processing_config (block):
        - chunking_config (optional, block):
            - layout_based_chunking_config (optional, block):
                - chunk_size (optional)
                - include_ancestor_headings (optional)
        - default_parsing_config (optional, block):
            - digital_parsing_config (optional, block):
            - layout_parsing_config (optional, block):
                - enable_get_processed_document (optional)
                - enable_image_annotation (optional)
                - enable_llm_layout_parsing (optional)
                - enable_table_annotation (optional)
                - exclude_html_classes (optional)
                - exclude_html_elements (optional)
                - exclude_html_ids (optional)
                - structured_content_types (optional)
            - ocr_parsing_config (optional, block):
                - use_native_text (optional)
        - parsing_config_overrides (optional, block):
            - digital_parsing_config (optional, block):
            - file_type (required)
            - layout_parsing_config (optional, block):
                - enable_get_processed_document (optional)
                - enable_image_annotation (optional)
                - enable_llm_layout_parsing (optional)
                - enable_table_annotation (optional)
                - exclude_html_classes (optional)
                - exclude_html_elements (optional)
                - exclude_html_ids (optional)
                - structured_content_types (optional)
            - ocr_parsing_config (optional, block):
                - use_native_text (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    data_store_id                = string
    display_name                 = string
    industry_vertical            = string
    location                     = string
    acl_enabled                  = optional(bool)
    content_config               = optional(string)
    create_advanced_site_search  = optional(bool)
    deletion_policy              = optional(string)
    kms_key_name                 = optional(string)
    project                      = optional(string)
    skip_default_schema_creation = optional(bool)
    solution_types               = optional(list(string))
    advanced_site_search_config = optional(object({
      disable_automatic_refresh = optional(bool)
      disable_initial_index     = optional(bool)
    }))
    document_processing_config = optional(object({
      chunking_config = optional(object({
        layout_based_chunking_config = optional(object({
          chunk_size                = optional(number)
          include_ancestor_headings = optional(bool)
        }))
      }))
      default_parsing_config = optional(object({
        digital_parsing_config = optional(object({
        }))
        layout_parsing_config = optional(object({
          enable_get_processed_document = optional(bool)
          enable_image_annotation       = optional(bool)
          enable_llm_layout_parsing     = optional(bool)
          enable_table_annotation       = optional(bool)
          exclude_html_classes          = optional(list(string))
          exclude_html_elements         = optional(list(string))
          exclude_html_ids              = optional(list(string))
          structured_content_types      = optional(list(string))
        }))
        ocr_parsing_config = optional(object({
          use_native_text = optional(bool)
        }))
      }))
      parsing_config_overrides = optional(list(object({
        digital_parsing_config = optional(object({
        }))
        file_type = string
        layout_parsing_config = optional(object({
          enable_get_processed_document = optional(bool)
          enable_image_annotation       = optional(bool)
          enable_llm_layout_parsing     = optional(bool)
          enable_table_annotation       = optional(bool)
          exclude_html_classes          = optional(list(string))
          exclude_html_elements         = optional(list(string))
          exclude_html_ids              = optional(list(string))
          structured_content_types      = optional(list(string))
        }))
        ocr_parsing_config = optional(object({
          use_native_text = optional(bool)
        }))
      })))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  # Note: 3 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

