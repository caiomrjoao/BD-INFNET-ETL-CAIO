with source as (
    select * from {{ source('bq_source', 'fato_vendas') }}
),

renamed as (
    select
        cast(pedido_id as string) as id_pedido,
        cast(vendedor_sk as int64) as sk_vendedor,
        cast(produto_sk as int64) as sk_produto,
        cast(valorTotalItem as numeric) as valor_total,
        cast(valorFrete as numeric) as valor_frete,
        dataCompra_sk
    from source
)

select * from renamed
