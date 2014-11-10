@SchemasField = {}
SchemasField.createdAt = 
    type: Date
    autoValue: ->
        return new Date                 if (this.isInsert)
        return {$setOnInsert: new Date} if (this.isUpsert)
        this.unset()

SchemasField.updatedAt = 
    type: Date
    autoValue: ->
        return new Date         if (this.isUpdate)
    denyInsert: true
    optional:   true

