module GoogleAPIDiscovery

struct Icons
    x16::String
    x32::String
end

struct Endpoint
    endpoint_url::String
    location::String
    description::String
    deprecated::Bool
end

struct Annotations
    required::Vector{String}
end

struct DocumentParameter
    id::String
    type::String
    $ref::String
    description::String
    default::String
    required::Bool
    format::String
    pattern::String
    minimum::String
    maximum::String
    enum::Vector{String}
    enum_descriptions::Vector{String}
    repeated::Bool
    location::String
    properties::Dict{String, Union{NamedTuple, Dict}}
    additional_properties::Dict
    items::Dict
    annotations::Annotations
end

struct Scope
    description::String
end

struct OAuth2
    scopes::Dict{String, Scope}
end

struct Auth
    oauth2::OAuth2
end

struct Schema
    id::String
    type::String
    $ref::String
    description::String
    default::String
    required::Bool
    deprecated::Bool
    format::String
    pattern::String
    minimum::String
    maximum::String
    enum::Vector
    enum_descriptions::Vector
    enum_deprecated::Vector
    repeated::Bool 
    location::String
    properties::Dict
    additional_properties::Dict
    items::Dict
    annotations::Annotations
end    

struct MethodParameter
    id::String
    type::String
    $ref::String
    description::String
    default::String
    required::Bool
    deprecated::Bool
    format::String
    pattern::String
    minimum::String
    maximum::String
    enum::Vector{String}
    enum_deprecated::Vector{String}
    repeated::Bool
    location::String
    properties::Dict
    additional_properties::Dict
    items::Dict
    annotations::Annotations
end

struct Simple
    multipart::Bool
    path::String
end

struct Resumable
    multipart::Bool
    path::String
end

struct Protocols
    simple::Simple
    resumable::Resumable
end

struct MediaUpload
    accept::Vector{String}
    max_size::String
    protocols::Protocols
end

struct Request
    $ref::String
    parameter_name::String
end

struct Response
    $ref::String
end

struct Method
    id::String
    description::String
    deprecated::Bool
    parameters::Dict{String, MethodParameter}
    parameter_order::Vector{String}
    scopes::Vector{String}
    supports_media_download::Bool
    supports_media_upload::Bool
    media_upload::MediaUpload
    supports_subscription::Bool
    path::String
    http_method::String
    request::Request
    response::Response
    
end

struct ResourceParameter
    id::String
    type::String
    $ref::String
    description::String
    default::String
    required::Bool
    deprecated::Bool
    format::String
    pattern::String
    minimum::String
    maximum::String
    enum::Vector{String}
    enum_descriptions::Vector{String}
    enum_deprecated::Vector{String}
    repeated::Bool
    location::String
    properties::Dict
    additional_properties::Dict
    items::Dict
    annotations::Annotations
end

struct ResourceMethod
    id::String
    path::String
    flat_path::String
    http_method::String
    description::String
    deprecated::Bool
    parameters::Dict{String, ResourceParameter}
    parameter_order::Vector{String}
    request::Request
    response::Response
    scopes::Vector{String}
    supports_media_download::Bool
    supports_media_upload::Bool
    supports_subscription::Bool
    protocols::Protocols

end

struct SubResource
    methods::Dict{String, ResourceMethod}
    deprecated::Bool
end

struct Resource
    methods::Dict{String, ResourceMethod}
    deprecated::Bool
    resources::Dict{String, SubResource}
end

struct DiscoveryDocument
    kind::String
    discovery_version::String
    id::String
    name::String
    canonical_name::String
    version::String
    revision::String
    title::String
    description::String
    icons::Icons
    documentation_link::String
    labels::Vector{String}
    protocol::String
    root_url::String
    service_path::String
    batch_path::String
    endpoints::Vector{Endpoint}
    parameters::Dict{String, Parameter}
    auth::Auth
    features::Vector{String}
    schemas::Dict{String, Schema}
    methods::Dict{String, Method}
    resources::Dict{String, Resource}
end

end